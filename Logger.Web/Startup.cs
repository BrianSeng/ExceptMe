using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Logger.Web.Startup))]
namespace Logger.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
