Vim
======

自用的vim配置，适用于 `Go` 语言最小开发环境。

适用版本：只在MacOS与Linux下vim8.0+测试验证过。

## 安装

### Linux & MacOS

```shell
# 下载xvim
cd ~
git clone https://github.com/xtfly/xvim .xvim

unlink  ~/.vimrc
ln -s ~/.xvim/vimrc.vim  ~/.vimrc

# 安装vim-plug
mkdir -p ~/.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# 安装所有的插件
vim +PlugInstall
```
 
## 依赖软件

### ctags

majutsushi/tagbar插件依赖ctags来解析。可以此地址下载：[ctags](http://ctags.sourceforge.net/)

若是ArchLinux，可以直接安装

    sudo pacman -S ctags


若是MacOS，可采用brew安装

    brew install ctags


### vim-go

vim-go插件依赖一大堆go程序，可以通过运行`:GoInstallBinaries`来自行安装。前提是你已经正确安装go、git。而且有一部分go程序源代码处在墙外。

在Go1.12以后，可以设置GOPROXY,

    export GOPROXY=https://goproxy.cn

### powerline-fonts

airline需要使用到这些字体，用于美化状态栏。

linux/osx：
```shell
cd ~
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
```

## 快捷键

自定义的快捷键:

 快捷键         | 对应操作
 ------------- | :---------
 `<F2>`        | 打开文件浏览窗口(NERDTree)
 `<F3>`        | 打开类/函数视图(tagbar)
 `<C-j>`       | 窗口上移
 `<C-k>`       | 窗口下移
 `<C-h>`       | 窗口左移
 `<C-l>`       | 窗口右移
 `<C-Tab>`     | 切换到下一个Buffer 
 `<C-S-Tab>`   | 切换到上一个Buffer
 `jj`          | ESC
 `<C-g>`       | ESC
 `gd`          | Go符号跳转
 `<C-o>`       | 向后跳转
 `<C-t>`       | 多次回跳


## 版权

本项目采用[MIT](http://opensource.org/licenses/MIT)开源授权许可证。
