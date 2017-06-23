using Logger.Domain.Exceptions;
using Logger.Domain.Services;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;

namespace Logger.Domain.Handlers
{
    public class WebApiMissingRouteHandler : DelegatingHandler
    {
        protected override async Task<HttpResponseMessage> SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
        {
            HttpResponseMessage response = await base.SendAsync(request, cancellationToken);

            try
            {
                if ((int)response.StatusCode == 404)
                {
                    throw new WebApiMissingRouteException("The requested API endpoint was not found");
                }
            }
            catch (System.Exception ex)
            {
                LoggerService.Insert(ex);
            }
            return response;
        }
    }
}
