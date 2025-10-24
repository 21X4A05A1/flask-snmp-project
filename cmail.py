import smtplib #to send email from one mail another
from email.message import EmailMessage #module used to create email template
def send_mail(to,subject,body):
    server=smtplib.SMTP_SSL('smtp.gmail.com',465)#creating server object from 
    server.login('sravyakondapalli10@gmail.com','tupo ggck hncc tlnh')
    msg=EmailMessage()
    msg['FROM']='sravyakondapalli10@gmail.com'
    msg['TO']=to
    msg['SUBJECT']=subject
    msg.set_content(body)
    server.send_message(msg)
    server.close()