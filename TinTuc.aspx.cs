using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TinTuc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Tintuc();
            TintucTop();
        }
    }
    private void Tintuc()
    {
        dlTinTuc.DataSource = XLDL.LayDuLieu("select * from TINTUC group by ID,URL,Hinh,TieuDe,TomTat,NgayDang having ID<(select top 1 id from tintuc order by id desc)-1 order by ID desc");
        dlTinTuc.DataBind();
    }
    private void TintucTop()
    {
        dlTinTucTop.DataSource = XLDL.LayDuLieu("select top 2 * from TINTUC order by id desc");
        dlTinTucTop.DataBind();
    }
}