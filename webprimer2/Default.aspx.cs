using System;
using System.IO;
using System.Xml;
using System.Xml.Serialization;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webprimer2
{
    public partial class _Default : System.Web.UI.Page
    {

        private List<Parameter> outobjects;

        protected void Page_Load(object sender, EventArgs e)
        {
            outobjects = XmlParser(AppDomain.CurrentDomain.BaseDirectory + "/Input.xml");// путь к xml
            foreach (var elem in outobjects)
            {
                ParameterControl elemControl = (ParameterControl)LoadControl("ParameterControl.ascx");
                elemControl.SetControl(elem);
                form1.Controls.Add(elemControl);
            }
            this.DataBind();
        }
        public List<Parameter> XmlParser(string file)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(List<Parameter>), new XmlRootAttribute("Parameters"));

            List<Parameter> i;

            using (Stream reader = new FileStream(file, FileMode.Open))
            {
                i = (List<Parameter>)serializer.Deserialize(reader);
            }

            return i;
        }
        public void Saving_Click(Object sender, EventArgs e)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(List<Parameter>));
            TextWriter writer = new StreamWriter(AppDomain.CurrentDomain.BaseDirectory + "/Output.xml"); //путь к xml
            outobjects.Clear();
            for (int i = 0; i < form1.Controls.Count; i++)
            {
                Type typeobj = form1.Controls[i].GetType();
                ParameterControl eCont = (ParameterControl)LoadControl("ParameterControl.ascx");
                if (typeobj.ToString() == eCont.GetType().ToString())
                {
                    Parameter param = new Parameter();
                    eCont = (ParameterControl)form1.Controls[i];
                    eCont.GetControl(ref param);
                    outobjects.Add(param);
                }
            }

        serializer.Serialize(writer, outobjects); 
        writer.Close(); 
        }
    }
}
