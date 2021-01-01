Vim
======

自用的vim配置，适用于 `Go`与`c++`语言最小开发环境。

注：只在MacOS与Linux下VIM8+与NeoVim上测试验证过。配置参考了[neovim中级玩法总结](https://zhuanlan.zhihu.com/p/288579378?utm_source=wechat_sessio)，在此感谢。

## 安装

### Linux & MacOS

```shell
# download xvim
cd ~
git clone https://github.com/xtfly/xvim .xvim

mkdir -p ~/.vim
ln -fs ~/.xvim/vimrc.vim  ~/.vimrc

# for neovim 
ln -fs ~/.vim ~/.config/nvim
ln -fs ~/.xvim/vimrc.vim  ~/.config/nvim/init.vim
```
 
## 依赖软件

### node

补全插件([neoclide/coc.nvim](https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim))依赖nodejs

若是ArchLinux，可以直接安装： `sudo pacman -S node`

若是MacOS，可采用brew安装： `brew install node`

设置国内源： `npm config set registry http://registry.npm.taobao.org`

更多的补全配置说明，参见 [Using-coc-extensions](https://github.com/neoclide/coc.nvim/wiki/Using-coc-extensions)

### ctags

类/函数视图插件([liuchengxu/vista.vim](https://github.com/liuchengxu/vista.vim))默认使用CoC。也可以使用ctags，它的地址下载：[ctags](https://github.com/universal-ctags/ctags)

### vim-go

vim-go插件依赖一大堆go程序，可以通过运行`:GoInstallBinaries`来自行安装。前提是你已经正确安装go、git。而且有一部分go程序源代码处在墙外。

在Go1.12以后，可以设置GOPROXY

    export GOPROXY=https://goproxy.cn
    export GOSUMDB=off

### pynvim

可选， 采用 `pip install pynvim`

## 快捷键

### 基础

 快捷键         | 对应操作
 ------------- | :---------
 `jj`          | ESC
 `Q`           | 关闭当前窗口
 `S`           | 保存当前窗口
 `<C-q>`       | 关闭当前窗口下面的窗口，如果下面没有窗口，则当前窗口将关闭
 `H`           | 左移行首
 `L`           | 右移行尾
 `J`           | 下移20行
 `K`           | 上移20行

### 功能键

 快捷键         | 对应操作
 ------------- | :---------
 `<F2>`        | 打开CocFzfList
 `<F3>`        | 打开类/函数视图
 `<F4>`        | 打开文件浏览窗口

### 窗口

#### 切换窗口

 快捷键         | 对应操作
 ------------- | :---------
 `<Space-j>`   | 窗口上移
 `<Space-k>`   | 窗口下移
 `<Space-h>`   | 窗口左移
 `<Space-l>`   | 窗口右移

#### 分割窗口

 快捷键         | 对应操作
 ------------- | :---------
 `sh`          | 分屏左边
 `sl`          | 分屏右边
 `sj`          | 分屏下边
 `sk`          | 分屏上边

#### 标签页

 快捷键         | 对应操作
 ------------- | :---------
 `tn`          | 新建一个标签页
 `th`          | 移至左侧标签页
 `tl`          | 移至右侧标签页
 `<Space-1~9>` | 切换到0~9标签页
 `<Space-0>`   | 关闭其它的标签页

### 代码

 快捷键         | 对应操作
 ------------- | :---------
 `gd`          | Go符号跳转
 `gd`          | 定义跳转
 `gr`          | 引用查找
 `gi`          | 实现查找
 `gy`          | 类型定义
 `<Space-r>`   | 符号改名
 `<Space-o>`   | 显示文档
 `<Space-s>`   | 选中一段
 `<Space-x>`   | 选中一个单词
 `<Space-a>`   | 对齐
 `<Space-f>`   | 格式化
 `<Space-c>`   | 注释
 `<Space-z>`   | 折叠
 `<C-o>`       | 向后跳转
 `<C-t>`       | 多次回跳

### Mark

 快捷键         | 对应操作
 ------------- | :---------
 `mm`          | 打Mark
 `m[`          | 上一个Mark
 `m]>`         | 下一个Mark

### 翻译

 快捷键         | 对应操作
 ------------- | :---------
 `<Space-t>`   | 翻译

### FZF模糊查找

 快捷键         | 对应操作
 ------------- | :---------
 `ff`   | 模糊查找文件
 `fg`   | 模糊查找文件内容
 `fb`   | 模糊查找缓冲区
 `fh`   | 模糊查找历史文件

## 版权

本项目采用[MIT](http://opensource.org/licenses/MIT)开源授权许可证。
