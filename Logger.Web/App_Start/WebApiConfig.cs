using Logger.Domain.Handlers;
using System.Web.Http;

namespace Logger.Web
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            // Register custom handlers
            config.MessageHandlers.Add(new WebApiMissingRouteHandler());
            config.MessageHandlers.Add(new WebApiBadRequestHandler());
        }
    }
}
