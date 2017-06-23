using Logger.Domain.Services;
using System.Net;
using System.Web.Http.Filters;

namespace Logger.Domain.Filters
{
    public class WebApiExceptionFilter : ExceptionFilterAttribute
    {
        public override void OnException(HttpActionExecutedContext actionExecutedContext)
        {
            LoggerService.Insert(actionExecutedContext.Exception);
            actionExecutedContext.Response = new System.Net.Http.HttpResponseMessage(HttpStatusCode.InternalServerError);
        }
    }
}
