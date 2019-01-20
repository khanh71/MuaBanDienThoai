using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuanTriVien : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            admin();
        }
    }
    private void admin()
    {
        dlAdmin.DataSource = XLDL.LayDuLieu("select * from admin");
        dlAdmin.DataBind();
    }

    protected void dlAdmin_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        int id = int.Parse(dlAdmin.DataKeys[e.Item.ItemIndex].ToString());
        try
        {
            XLDL.Chaylenh("delete admin where id=" + id);
            admin();
        }
        catch { }
    }

    protected void dlAdmin_EditCommand(object source, DataListCommandEventArgs e)
    {
        int id = int.Parse(dlAdmin.DataKeys[e.Item.ItemIndex].ToString());
        Response.Redirect("~/suaadmin.aspx?id=" + id);
    }
}