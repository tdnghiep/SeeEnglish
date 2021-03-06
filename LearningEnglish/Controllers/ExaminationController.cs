﻿using LearningEnglish.App_Business.Examination;
using LearningEnglish.App_Data;
using LearningEnglish.APP_Service.ExaminationService;
using LearningEnglish.APP_Service.QuestionAndAnswerService;
using LearningEnglish.APP_Service.StaffService;
using LearningEnglish.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace LearningEnglish.Controllers
{
    public class ExaminationController : ApiController
    {
        public dynamic Get([FromUriAttribute] StaffParams staffParams)
        {
            ExaminationService examSv = new ExaminationService();

            dynamic wrap;
            wrap = examSv.GetExaminationInfoByID("exam_001");
            return wrap;
        }
    }
}
