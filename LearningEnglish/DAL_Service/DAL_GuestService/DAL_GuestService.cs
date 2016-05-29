using LearningEnglish.App_Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.DAL_Service.DAL_GuestService
{
    public class DAL_GuestService
    {

        public bool CreateGuestInfo(guest_tbl guest)
        {
            bool ret = false;
            try
            {
                using (EnglishCenterDBDataContext db = new EnglishCenterDBDataContext())
                {
                    db.guest_tbls.InsertOnSubmit(guest);
                    db.SubmitChanges();
                    ret = true;
                }
            }
            catch (Exception ex)
            {
                ret = false;
            }
            return ret;
        }
    }
}