using System.Web;
using System.Web.Mvc;

namespace Microsoft.Sample.Automation.Scheduling.Web
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}