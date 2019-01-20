using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class SlideHome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            slide();
        }
    }
    private void slide()
    {
        dlHinh.DataSource = XLDL.LayDuLieu("select * from bannerhome");
        dlHinh.DataBind();
    }

    protected void dlHinh_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        int id = int.Parse(dlHinh.DataKeys[e.Item.ItemIndex].ToString());
        CheckBox cbHinh = (CheckBox)e.Item.FindControl("cbHinh");
        DataTable dt = XLDL.LayDuLieu("select hien from bannerhome where id=" + id);
        if(dt.Rows.Count>0)
        {
            if (dt.Rows[0][0].ToString() == "True")
                cbHinh.Checked = true;
            else
                cbHinh.Checked = false;
        }

    }

    protected void dlHinh_DeleteCommand(object source, DataListCommandEventArgs e)
    {
        try
        {
            int id = int.Parse(dlHinh.DataKeys[e.Item.ItemIndex].ToString());
            DataTable dt = XLDL.LayDuLieu("select hinh from bannerhome where id=" + id);
            if (dt.Rows.Count > 0)
            {
                string tenfile = "~/images/home/banner/" + dt.Rows[0][0].ToString();
                File.Delete(Server.MapPath(tenfile));
                XLDL.Chaylenh("delete from bannerhome where id=" + id);
                slide();
            }
        }
        catch
        {
            Response.Write("<script>alert('Lỗi ! Vui lòng thử lại sau')</script>");
        }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        int bit = 0;
        foreach (DataListItem item in dlHinh.Items)
        {
            int id = int.Parse(dlHinh.DataKeys[item.ItemIndex].ToString());
            CheckBox cbHinh = (CheckBox)item.FindControl("cbHinh");
            if (cbHinh.Checked == true)
                bit = 1;
            else
                bit = 0;
            XLDL.Chaylenh("update bannerhome set hien=" + bit + " where id=" + id);
        }
        string tenhinh = "~/images/home/banner/";
        HttpFileCollection fileCollection = Request.Files;
        for (int i = 0; i < fileCollection.Count; i++)
        {
            HttpPostedFile uploadfile = fileCollection[i];
            string fileName = Path.GetFileName(uploadfile.FileName);
            if (uploadfile.ContentLength > 0)
            {
                string hinh = DateTime.Now.ToString("ddMMyyyy_hhmmss_tt_") + fileName;
                uploadfile.SaveAs(Server.MapPath(tenhinh) + hinh);
                XLDL.Chaylenh("insert into bannerhome(hinh) values('" + hinh+ "')");
            }
        }
        slide();
    }
}