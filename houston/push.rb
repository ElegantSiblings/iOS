
require  'houston'
#  development  /  product  를  test  환경에따라변경해서사용해주세요.
APN = Houston::Client.development
APN.certificate = File.read("./WoowahanFresh.pem")
#  Apple  developer  에등록되어있는  Push  notification  인증서.
#  (development/product에맞는인증서를설정해야함.)

#  AppDelegate  에서프린트되어여기서사용하게됨.
token = ARGV[0]
notification = Houston::Notification.new(device: token)

#  custom  alert  1  :  Simple  of  Simple
notification.alert = "iOS개발에도움이되는  Ruby  Gem들을만나보세요!"

#  custom  alert  2  :  Push  Notification  내용이여러줄일경우.
notification.alert = "iOS개발에도움이되는\nRuby  Gem들을만나보세요!"
notification.mutable_content =  true

#  custom  alert  3  :  특정뷰로이동되는  Push  Notification
notification.alert = "tachikoma의새로운내용이올라왔어요."
notification.custom_data = {url: "http://www.google.com"}

#  보내기실행  !
APN.push(notification)
