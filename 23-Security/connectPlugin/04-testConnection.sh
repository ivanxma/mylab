. ./comm.sh

echo "Testing for failure login for 6 times"

echo "Failure 1 :"
time mysql -t -umyuser -h127.0.0.1 -e "select @@port;"
echo "Failure 2 :"
time mysql -t -umyuser -h127.0.0.1 -e "select @@port;"
echo "Failure 3 :"
time mysql -t -umyuser -h127.0.0.1 -e "select @@port;"
echo "Failure 4 :"
time mysql -t -umyuser -h127.0.0.1 -e "select @@port;"
echo "Failure 5 :"
time mysql -t -umyuser -h127.0.0.1 -e "select @@port;"
echo "Failure 6 :"
time mysql -t -umyuser -h127.0.0.1 -e "select @@port;"


echo "Now log in as right User/Password"
time mysql -t -umyuser -h127.0.0.1 -pmyuser -e "select @@port;"
echo "Now log in as right User/Password"
time mysql -t -umyuser -h127.0.0.1 -pmyuser -e "select @@port;"
