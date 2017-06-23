using Logger.Domain.Models.Request;
using Logger.Domain.Models.Response;
using Logger.Domain.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Logger.Web.Controllers
{
    [RoutePrefix("api/except-me")]
    public class ExceptMeApiController : ApiController
    {
        [Route, HttpGet]
        public HttpResponseMessage GetAll()
        {
            int resultCount = 0;
            SearchResponse<Domain.Exception> response = new SearchResponse<Domain.Exception>();
            response.Items = LoggerService.SelectAll(out resultCount);
            response.ResultCount = resultCount;
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
        [Route("search"), HttpGet]
        public HttpResponseMessage Search([FromUri] ExceptionSearchRequest model)
        {
            if (!ModelState.IsValid)
            {
                return Request.CreateResponse(HttpStatusCode.BadRequest, ModelState);
            }
            //int resultCount = 0;
            SearchResponse<Domain.Exception> response = new SearchResponse<Domain.Exception>();
            //response.Items = LoggerService.Search(model, out resultCount);
            //response.ResultCount = resultCount;
            return Request.CreateResponse(HttpStatusCode.OK, response);
        }
    }
}
