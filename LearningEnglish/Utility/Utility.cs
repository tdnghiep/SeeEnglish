using System;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace LearningEnglish.Utility
{
    public class Utility
    {
        public static bool SendMail(
            string strTo,
            string strSubject,
            string strMsg,
            string attatchFile)
        {
            try
            {
                MailMessage mm = new MailMessage();
                
                mm.Subject = strSubject;
                mm.Body = strMsg;
                Attachment at = new Attachment(System.Web.HttpContext.Current.Server.MapPath(attatchFile));
                mm.Attachments.Add(at);
                mm.IsBodyHtml = false;

                mm.To.Add(new MailAddress(strTo));
                SmtpClient smtp = new SmtpClient();
                smtp.EnableSsl = true;
                smtp.SendAsync(mm, null);
                return true;

            }
            catch (Exception ex)
            {
                return false;
            }
        }

    }
}