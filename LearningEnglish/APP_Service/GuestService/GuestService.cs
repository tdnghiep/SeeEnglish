using LearningEnglish.App_Data;
using LearningEnglish.DAL_Service.DAL_GuestService;
using LearningEnglish.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.APP_Service.GuestService
{
    public class GuestService
    {
        DAL_GuestService dalGuestService;

        public GuestService()
        {
            dalGuestService = new DAL_GuestService();
        }

        public Boolean CreateGuestInfo(GuestModel guest)
        {
            guest_tbl newGuest = new guest_tbl()
            {
                email = guest.email,
                full_name = guest.fullname,
                phone_number = guest.phonenumber,
                notes = guest.notes,
                sent_files = ""
            };
            
            return dalGuestService.CreateGuestInfo(newGuest);
        }

    }
}