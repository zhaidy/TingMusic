using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(TingMusic.Startup))]
namespace TingMusic
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
