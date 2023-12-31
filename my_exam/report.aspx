<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report.aspx.cs" Inherits="my_exam.report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            border-style: solid;
            border-width: 2px;
        }
        .auto-style2 {
            height: 25px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server">
        <div>
            <table border="2" class="auto-style1">
                <tr>
                    <td class="auto-style2">User</td>
                    <td class="auto-style2">Date</td>
                    <td class="auto-style2">Test Name</td>
                    <td class="auto-style2">Marks</td>
                    <td class="auto-style2">Total Marks</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <%
                    while (dr.Read())
                    {
              %>
                <tr>
                    <td bgcolor="#FFFFCC">
                        <%= dr.GetValue(0) %>
                    </td>
                    <td bgcolor="#FFFFCC">
                        <%= dr.GetValue(1) %>
                    </td>
                    <td bgcolor="#FFFFCC">
                        <%= dr.GetValue(2) %>
                    </td>
                    <td bgcolor="#FFFFCC">
                        <%= dr.GetValue(3) %>
                    </td>
                    
                    <td bgcolor="#FFFFCC">
                        <%=dr.GetValue(4) %>
                    </td>
                </tr>
                <%
                    }
                    con.Close();
                    
                    
                    %>
            </table>
        </div>
    </form>
</body>
</html>
