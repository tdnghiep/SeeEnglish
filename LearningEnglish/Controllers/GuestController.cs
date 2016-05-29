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
            GuestService guestSv = new GuestService();
            if (guestSv.CreateGuestInfo(guest))
            {
                Utility.Utility.SendMail(
                    guest.email, 
                    "[SEE ENGLISH] TEST MAIL",
                    "TESTTTTT",
                    "~/Uploaded/txt.doc");
            }
            return true;
        }
    }
}