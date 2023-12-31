<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="panel.aspx.cs" Inherits="my_exam.panel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 327px;
        }
        .auto-style3 {
            width: 461px;
        }
    </style>
     <script type = "text/javascript">
        var time = 30; //-- Timer of 120 seconds i.e. 2 minutes
        window.onload = function () {
            setInterval(function () {
                var timer = document.getElementById("<%=lbltimer.ClientID %>");
                time--;
                timer.innerHTML = time;
                if (time == 0) {
                    document.getElementById("<%=next.ClientID %>").click();
                }
            }, 1000)
        };
     </script>
   
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center">
                <tr>
                    <td> Online Examination System</td>
                </tr>
                <tr>
                    <td>&nbsp;
                    </td></tr>
                <tr>
                    <td bgcolor="#99999">
                    <a href="">Logout</a></td>
                </tr>
                <tr>
                    <td>
                        &nbsp;Timer:<asp:Label ID="lbltimer" runat="server" ForeColor="Red">60</asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="msg" runat="server" ForeColor="#00CC00"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center">
                        <table align="center" bgcolor="#3399FF">
                            <tr>
                                <td>&nbsp;</td>
                                <td bgcolor="#FFFFCC" class="auto-style3">
                                       <% 
                                           con.Open();
                                           rqry = "select * from question where settype='" + testtype + "' order by qid";
                                           rcmd = new System.Data.SqlClient.SqlCommand(rqry, con);
                                           rdr = rcmd.ExecuteReader();
                                           c = 1;

                                           while (rdr.Read())
                                           {
                                               if (c != count)
                                               {
                                                   c = c + 1;
                                               }
                                               else if (c == count)
                                               {
                                %><% int q = Convert.ToInt16(rdr.GetValue(0));
                                      qid = q; %>
                                          <table align="center">
                                              <tr>
                                                  <td class="auto-style2">&nbsp;</td>
                                              </tr>
                                              <tr>
                                              <td class="auto-style2">
                                                Q-<%= count %><%=rdr.GetValue(1) %>
                                              </td>
                                                  </tr>
                                              <tr>
                                                  <td class="auto-style2">&nbsp;</td>
                                              </tr>
                                              <tr>
                                                  <td class="auto-style2">
                                                      <asp:RadioButton ID="RadioButton1" runat="server" Checked="true" GroupName="opt" />
                                                       <%=rdr.GetValue(3) %>

                                                  </td>
                                              </tr>
                                        <tr>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="opt" />
                        <%=rdr.GetValue(4) %>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:RadioButton ID="RadioButton3" runat="server" GroupName="opt" />
                        <%=rdr.GetValue(5) %>
                    </td>
                </tr>

                <tr>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                                              <tr>
                                                     <td class="auto-style2">
                        <asp:RadioButton ID="RadioButton4" runat="server"  GroupName="opt"/>
                         <%=rdr.GetValue(6) %>
                                                         
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                                              <tr>
                    <td class="auto-style2">&nbsp;</td>
                </tr>
                                              <td class="auto-style2">
                                              <table align="center">

                                                    <tr>
                                                      <td>
                                                             <asp:Button ID="next" runat="server" Text="Next" OnClick="Button1_Click" />
                                                      </td>
                                                  </tr>
                                                  <tr>
                                                      <td>
                                                             <asp:Button ID="finish" runat="server" Text="Finish" OnClick="Button2_Click" />
                                                      </td>
                                                  </tr>
                                              </table>
                                
                                          </table>
                                    <% if (count != n)

                            c = c + 1;
                    }
                  }  con.Close(); %>
        

                                </td>
                            </tr>

                        </table>
                        </td>
                    </table>
                    
            </div>
    </form>
</body>
</html>
