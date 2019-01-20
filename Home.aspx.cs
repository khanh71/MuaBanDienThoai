using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;

public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            congty();
            thanhtoan();
            dienthoai();
        }
    }
    [WebMethod]
    public static List<countrydetails> congty()
    {
        DataTable dt = XLDL.LayDuLieu("select tencty,count(masp) from congty,dienthoai where congty.macty=dienthoai.macty group by tencty");
        List<countrydetails> dataList = new List<countrydetails>();
        foreach (DataRow dtrow in dt.Rows)
        {
            countrydetails details = new countrydetails();
            details.Countryname = dtrow[0].ToString();
            details.Total = Convert.ToInt32(dtrow[1]);
            dataList.Add(details);
        }
        return dataList;
    }
    [WebMethod]
    public static List<countrydetails> thanhtoan()
    {
        DataTable dt = XLDL.LayDuLieu("select thanhtoan,count(sodh) from donhang group by thanhtoan");
        List<countrydetails> dataList = new List<countrydetails>();
        string str = "";
        foreach (DataRow dtrow in dt.Rows)
        {
            if (dtrow[0].ToString() == "True")
                str = "Chuyển Khoản";
            else
                str = "Tiền Mặt";
            countrydetails details = new countrydetails();
            details.Countryname = str;
            details.Total = Convert.ToInt32(dtrow[1]);
            dataList.Add(details);
        }
        return dataList;
    }
    [WebMethod]
    public static List<countrydetails> dienthoai()
    {
        DataTable dt = XLDL.LayDuLieu("SELECT tensp,soluongban from dienthoai left join kho on dienthoai.masp=kho.masp");
        List<countrydetails> dataList = new List<countrydetails>();
        foreach (DataRow dtrow in dt.Rows)
        {
            countrydetails details = new countrydetails();
            details.Countryname = dtrow[0].ToString();
            details.Total = Convert.ToInt32(dtrow[1]);
            dataList.Add(details);
        }
        return dataList;
    }
}
public class countrydetails
{
    public string Countryname { get; set; }
    public int Total { get; set; }
}