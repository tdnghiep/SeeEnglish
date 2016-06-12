using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.Models
{
    public class UserModelBase
    {
        public string username = "";
        public string email = "";
        public string password = "";
        public string firstName = "";
        public string lastName = "";
    }
    public class RegisterModel : UserModelBase
    {
        public string repeatPassword = "";
    }

    public class LogginModel : UserModelBase
    {
        public bool isLogged = false;
        public bool hasError = false;
        public string errMsg = String.Empty;
    }
}