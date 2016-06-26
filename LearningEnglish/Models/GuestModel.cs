using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LearningEnglish.Models
{
    public class GuestModel
    {
        public string FullName { get; set; }
        public string Email { get; set; }
        public string PhoneNumber { get; set; }
        public string Notes { get; set; }
        public short Type { get; set; }
        public int ExaminationId { get; set; }
        public short CorrectAnswerNum { get; set; }
    }
}