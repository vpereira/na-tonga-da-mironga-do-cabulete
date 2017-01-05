for p in `ls *.rpm`; do
	rpm --define "_topdir /home/vpereira/rpms" -i $p
done

for s in `ls SPECS/*.spec`; do
	rpmbuild --define "_topdir /home/vpereira/rpms" -bp $s
done
