Intel OneAPI 软件开发工具包
===========================

:本节贡献者: |田冬冬|\（作者）、
             |姚家园|\（作者）
:最近更新时间: 2022-01-08

----

`Intel oneAPI <https://software.intel.com/content/www/us/en/develop/tools/oneapi.html>`__
是 Intel 公司提供的免费软件开发工具包。该工具包中包含了 C/C++ 编译器（``icc`` 命令）
和 Fortran 编译器（``ifort`` 命令），以及 MKL 数学库、MPI 并行库等众多软件开发工具。


.. tab-set::

    .. tab-item:: Fedora

        在 Fedora 系统下，官方手册提供了\
        `多种安装方式 <https://software.intel.com/content/www/us/en/develop/documentation/installation-guide-for-intel-oneapi-toolkits-linux/>`__。
        这里，我们推荐使用 ``dnf`` 安装。

        下载 :file:`.repo` 文件 :download:`oneapi.repo`，并将其放在 :file:`/etc/yum.repos.d` 目录下::

            $ sudo mv oneapi.repo /etc/yum.repos.d/

        根据自己的需要安装 C/C++ 或 Fortran 编译器，默认安装目录是 :file:`/opt/intel/oneapi`::

            # 安装 C/C++ 编译器
            $ sudo dnf install intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic

            # 安装 Fortran 编译器
            $ sudo dnf install intel-oneapi-compiler-fortran

        安装完成后还需要配置环境变量::

            $ echo "source /opt/intel/oneapi/setvars.sh >/dev/null 2>&1" >> ~/.bashrc

        .. dropdown:: Intel 软件开发工具列表
            :color: info
            :icon: info

            使用如下命令可以列出 Intel 软件仓库提供的所有软件包::

                $ sudo -E dnf --disablerepo="*" --enablerepo="oneAPI" list available

    .. tab-item:: Ubuntu

        在 Ubuntu 系统下，官方手册提供了\
        `多种安装方式 <https://software.intel.com/content/www/us/en/develop/documentation/installation-guide-for-intel-oneapi-toolkits-linux/>`__。
        这里，我们推荐使用 ``apt`` 安装。

        添加 Intel 软件仓库::

            # 下载 Intel 仓库公钥并添加到 apt 源密钥环中
            $ wget https://apt.repos.intel.com/intel-gpg-keys/GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
            $ sudo apt-key add GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB
            # 删除公钥文件
            $ rm GPG-PUB-KEY-INTEL-SW-PRODUCTS.PUB

            # 添加软件仓库
            $ sudo add-apt-repository "deb https://apt.repos.intel.com/oneapi all main"
            $ sudo apt update

        根据自己的需要安装 C/C++ 或 Fortran 编译器，默认安装目录是 :file:`/opt/intel/oneapi`::

            # 安装 C/C++ 编译器
            $ sudo apt install intel-oneapi-compiler-dpcpp-cpp-and-cpp-classic

            # 安装 Fortran 编译器
            $ sudo apt install intel-oneapi-compiler-fortran

        安装完成后还需要配置环境变量::

            $ echo "source /opt/intel/oneapi/setvars.sh >/dev/null 2>&1" >> ~/.bashrc

        .. dropdown:: Intel 软件开发工具列表
            :color: info
            :icon: info

            使用如下命令可以列出 Intel 软件仓库提供的所有软件包::

                $ sudo -E apt-cache pkgnames intel

    .. tab-item:: macOS

        在 macOS 下，官方手册提供了\
        `多种安装方式 <https://software.intel.com/content/www/us/en/develop/documentation/installation-guide-for-intel-oneapi-toolkits-macos/>`__。
        这里，我们下载离线安装包进行安装。

        根据自己的需要，从官网下载
        `C/C++ 编辑器 <https://software.intel.com/content/www/us/en/develop/articles/oneapi-standalone-components.html#compilerclassic>`__
        或 `Fortran 编译器 <https://software.intel.com/content/www/us/en/develop/articles/oneapi-standalone-components.html#fortran>`__
        的离线安装包（Offline），然后直接双击安装。默认安装目录是 :file:`/opt/intel/oneapi`。

        安装完成后还需要配置环境变量::

            $ echo "source /opt/intel/oneapi/setvars.sh >/dev/null 2>&1" >> ~/.zshrc

        .. dropdown:: Intel 软件开发工具列表
            :color: info
            :icon: info

            Intel oneAPI 提供了众多软件开发工具，用户可以根据需要到
            `Intel 官网 <https://software.intel.com/content/www/us/en/develop/articles/oneapi-standalone-components.html>`__
            下载其他 macOS 离线安装包并安装。
