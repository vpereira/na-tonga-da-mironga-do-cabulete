FROM opensuse
RUN useradd vpereira -m -d /home/vpereira -g users && echo "vpereira:opensuse" | chpasswd
RUN zypper ref
RUN zypper install -y sudo vim osc
RUN zypper install -t pattern -y devel_rpm_build
USER vpereira
WORKDIR /home/vpereira
COPY pkg.sh /home/vpereira
