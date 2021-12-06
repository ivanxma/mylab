mkdir -p ~/.mysqlsh/plugins/
curl https://codeload.github.com/lefred/mysqlshell-plugins/zip/refs/heads/master > master.zip
unzip master.zip -d ~/.mysqlsh/plugins/
mv ~/.mysqlsh/plugins/mysqlshell-plugins-master/* ~/.mysqlsh/plugins/

