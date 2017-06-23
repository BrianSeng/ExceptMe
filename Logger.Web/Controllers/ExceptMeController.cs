using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Logger.Web.Controllers
{
    [RoutePrefix("except-me")]
    public class ExceptMeController : Controller
    {
        [Route("log")]
        public ActionResult Index()
        {
            return View();
        }
    }
}