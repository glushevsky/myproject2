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
        public List<Parameter> outobject;
        protected void Page_Load(object sender, EventArgs e)
        {
            outobject = XmlParser("C:/Documents and Settings/Glushevskiy/Desktop/2008/webprimer2/Input.xml");//C:/Documents and Settings/Glushevskiy/Desktop/webprimer2/Input.xml
            //ParameterControl testParCont = new ParameterControl();
                ParameterControl testParCont = new ParameterControl();
                testParCont.elems = outobject;
                testParCont.elem.Value = "aaaaaaaaaa";
                testParCont.elem.Id = "1111111";
                testParCont.AddControl();
            
                //testParCont.elem.InitObj(outobject[i].Id, outobject[i].Name, outobject[i].Description, outobject[i].Type, outobject[i].Value);
                /*ParameterControl testParCont = new ParameterControl();
                testParCont.elem.Id = outobject[i].Id;
                testParCont.elem.Name = outobject[i].Name;
                testParCont.elem.Description = outobject[i].Description;
                testParCont.elem.Type = outobject[i].Type;
                testParCont.elem.Value = outobject[i].Value;
                Label testLabel = new Label();
                testLabel.Text = outobject[i].Value;
                testLabel.ID = outobject[i].Id;
                paramElement.Controls.Add(testLabel);
                //testParCont.AddControl();
            }*/
           
            this.DataBind();
        }
        public List<Parameter> XmlParser(string filename)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(List<Parameter>), new XmlRootAttribute("Parameters"));
            //XmlSerializer serializer = new XmlSerializer(typeof(Parameter));

            List<Parameter> i;

            using (Stream reader = new FileStream(filename, FileMode.Open))
            {
                i = (List<Parameter>)serializer.Deserialize(reader);
            }

            return i;
        }
    }
}