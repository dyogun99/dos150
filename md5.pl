use LWP::UserAgent;
use HTTP::Request::Common;
system('cls');
system('title Md5 Crack Online');
print "\n\t***********************************\n";
print "\t===>  MD5 Crack Online \n";
print "\t===>  Coded by XeroCool \n";
print "\t===>  Option : Pick  Mode = 1 \n";
print "\t***********************************\n";
print "\n  Pick Mode ~# ";
$pick=<STDIN>;
chop($pick);
if($pick == "1"){
MD5FAIL:
print "\nEnter Md5 Hash ~# ";
$hash=<STDIN>;
chop($hash);
if (length($hash)==32)
{  
print "\n\t***********************************\n";
print "\t===>  MD5 Crack Online <===\n";
print "\t===>  Coded by XeroCool <===\n";
print "\t***********************************\n";
&next;
} else {
print "\nThis is not a md5 hash!\n\n$hash \n\nTry Again!\n\n";
goto MD5FAIL;
}
}
sub next {
$url = "http://md5.hashcracking.com/search.php?md5=$hash";
$lwp = LWP::UserAgent->new();
$lwp->agent("Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.4) Gecko/2008102920 Firefox/3.0.4");
$connect = $lwp -> get($url);
print "[+] md5.hashcracking.com        ----  ";
if ($connect->content =~ /Cleartext of $hash is (.*)/)
{
print "Result : $1\n";
} else {
print "Result : Hash not found!\n";
}
$url = "http://www.hashchecker.com/index.php?_sls=search_hash";
$lwp = LWP::UserAgent->new();
$lwp->agent("Mozilla/5.0 (Windows; U; Windows NT 5.1; en; rv:1.9.0.4) Gecko/2008102920 Firefox/3.0.4");
$request = $lwp->post($url, ["search_field" => $hash, "Submit" => "search"]);
print "[+] www.hashchecker.com         ----  ";
if ($request->content =~ /<td><li>Your md5 hash is :<br><li>$hash is <b>(.*)<\/b> used charlist/)
{
print "Result : $1\n";
} else {
print "Result : Hash not found!\n";
}
}