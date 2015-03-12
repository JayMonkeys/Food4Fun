using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Food4FunWebSite.Startup))]
namespace Food4FunWebSite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
