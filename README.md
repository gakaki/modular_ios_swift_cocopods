# modular_ios_swift_cocopods
using cocopods and swift4 for modular ios project

# Swift的组件化(一) 基础设施 cocopods 二进制化 framework 篇
  本文基于DianQK的[基于 CocoaPods 进行 iOS 开发](https://github.com/DianQK/DevOnPods)

来实现组件化实践,区别点是本文的目的是基于多层继承的方案.类似Android那样的,
每个模块(业务模块的意思,例如首页模块,我的设置模块,商品列表,商品详情模块,购物车模块)依赖于若干个通用Library,之后有一个主project集成各个模块.
而每个模块又可以单独在自己的ExampleProject里跑
(用pod lib create 命令选择Example Project,YES) 

## 最终目标
[完成的Swift组件化demo](https://github.com/gakaki/modular_ios_swift_cocopods)

    Clone之后说明如下:
    
    ModifySpecs
    这是将ObjectiveC项目能够被二进制framework化的一个cocopods spec.这里的例子是UMeng分析
    ,由于Umeng分析库在官方pods上是没有module.modulemap文件的,具体原理见DianK的文章.
    (意思是手动添加module.modulemap之后就可以不用写什么bridge文件OC2Swift了).
    
    CommonLib       
    组件化的最基础的库例如util,外部framework依赖都可以做到这里,放在一起的目的是为了后面
    可以做framework二进制化,加速编译.之后的每个组件化模块都会依赖到CommonLib.
    已配一个ExampleProject辅助测试.
    
    ModuleMainPage
    模块项目(例:电商首页模块),会依赖于CommonLib.已配一个ExampleProject辅助测试.
    
    MainProject
    整合模块的Project,最终成品的是这个.由它来集成所有的模块.

## 流程

#### 用 pod lib create 命令分别创建含有Example的三个项目 CommonLib,ModuleMainPage,MainProject.
#### CommonLib自然是基础库,在podspec里可以填写各种dependency,如下
   
s.vendored_frameworks = "vendor_frameworks/UMMobClick.framework"
s.framework           = "CoreTelephony"
s.libraries           = "sqlite3", "z"
  
手动去官网友盟下载分析,之后放入目录,注意按照DianQK文的方法,利用module.modulemap
文件直接让oc给swift做桥接,简单方便
也就是手动在umeng下载好的framework文件夹里添加modulemap文件
UMMobClick.framework/Modules/module.modulemap 
    
#### 为什么要这么做
   如果使用DiakQK的方案也就是直接用pod拉友盟,会发觉在Example Project里可以引用,
   在pod library(Development Pods)里项目无法引用
   (暂时不知道为何,也许是module map有问题),所以没辙.
   缺点就是一旦umeng更新了你得手动去下载重新集成了.....
   
之后把CommonLib提交到github上打上tag(cocopods 私有repo流程 ,你懂的),必须是tag没辙.这个得问cocopods了.
    
#### 来到ModuleMainPage(首页模块),这里的s.dependency 加上对CommonLib的引用.
注意: 如果遇到 pod install 出错的话 是由于static framework的问题
[!] The 'Pods-PROJECTNAME' target has transitive dependencies that include static binaries 
貌似在cocopods 1.3.0 beta.2解决了
如果还有的话 尝试在pod file里用这个,会去除对静态static library 包裹的frame人work的检查.
    
    Pod::Installer::Xcode::TargetValidator.module_eval do
     def verify_no_static_framework_transitive_dependencies
       puts '-> cancel the verify static framework'
     end
    end
    
#### 最后的MainProject就没啥好说的 pod 设置path => ../就好
#### Done!
    
    
## 优缺点

1 这里首先吐槽一下 SPM ( Swift Packer Manager),第一不支持UIKit项目,第二居然不支持git分支方式来获取依赖,也就是说只能用版本号也就是github里的tag来,这不是要烦死了吗对于小范围的本地修改,改一下传一下咯意思是...我去.....并且这么做的话例如现在rxswift有swift 4版本使用spm也就意味着拉不到swift4的版本了,因为swfit4的分之并没有打tag,然后如果你非要用怎么办,你只能fork一个,然后你给自己fork的项目来个tag,我想说简直了.另外还有时不时出现的LLVM ERROR: IO failure on output stream.总之很不成熟..无法用于实战生产环境.

2 DiakQK方案的好处是可以方便的在源码framework和二进制framework里切换.这个carthage需要使用
debug symbol,cocopods rome也是这个问题,一旦用了二进制切换源码,麻烦,如果是第三方的话倒是无所谓,想必也没多少人去调试almofire的源码吧,但是一旦遇到自己的组件化方案,来回切换很正常,也是刚需.

## 吐槽
我就搞不懂了,人家java android 那边 gradle 那套是有多简洁,作为一家top1的公司居然不愿意在
工具链上投入精力加速开发效率,我要对apple的ios部门竖起中指.(就不吐槽那稀烂的布局系统autolayout了,对比html的flexbox和gridlayout)


















