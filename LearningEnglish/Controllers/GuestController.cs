using LearningEnglish.APP_Service.GuestService;
using LearningEnglish.Models;
using System.Web.Http;

namespace LearningEnglish.Controllers
{
    public class GuestController : ApiController
    {
        [HttpPost]
        [Route("api/guest")]
        public dynamic CreateGuestInfo([FromBody] GuestModel guest)
        {
            guest.ExaminationId = -1;
            guest.CorrectAnswerNum = -1;
            GuestService guestSv = new GuestService();
            if (guestSv.CreateGuestInfo(guest))
            {
                Utility.Utility.SendMail(
                    guest.Email, 
                    "[SEE ENGLISH] TEST MAIL",
                    "TESTTTTT",
                    "~/Uploaded/txt.doc");
            }
            return true;
        }

        [HttpPost]
        [Route("api/guest/submit_test")]
        public dynamic SubmitTest([FromBody] GuestModel guest)
        {
            GuestService guestSv = new GuestService();
            return guestSv.CreateGuestInfo(guest);
        }
    }
}