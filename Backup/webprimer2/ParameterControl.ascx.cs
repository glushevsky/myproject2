using System;
using System.IO;
using System.Xml.Serialization;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace webprimer2
{
    public partial class ParameterControl : System.Web.UI.UserControl
    {

        public Parameter elem = new Parameter();
        public List<Parameter> elems = new List<Parameter>();
        //public Panel testPanel;
        protected void Page_Load(object sender, EventArgs e)
        {
            //outobject = XmlParser("C:/Documents and Settings/Glushevskiy/Desktop/2008/webprimer2/Input.xml");//C:/Documents and Settings/Glushevskiy/Desktop/webprimer2/Input.xml

            //this.DataBind();
            //testPanel = new Panel();
            //for (int i = 0; i < outobject.Count; i++)
            //{
            AddControl();
            //}
            this.DataBind();
        }
        /*public List<Parameter> XmlParser(string filename)
        {
            XmlSerializer serializer = new XmlSerializer(typeof(List<Parameter>), new XmlRootAttribute("Parameters"));
            //XmlSerializer serializer = new XmlSerializer(typeof(Parameter));

            List<Parameter> i;

            using (Stream reader = new FileStream(filename, FileMode.Open))
            {
                i = (List<Parameter>)serializer.Deserialize(reader);
            }

            return i;
        }*/
        public void AddControl()
        {
            /*Label testLabel = new Label();
            testLabel.Text = "text";
            //Panel testPanel = new Panel();
            testPanel.Controls.Add(testLabel);*/
            //Label testLabel = new Label();
            //testLabel.Text = outobject[0].Id;
            //paramElement.Controls.Add(testLabel);
                //Label testLabel = new Label();

                /*paramLabel1.Text = elem.Value;
                paramLabel1.ID = elem.Id;*/
            for (int i = 0; i < elems.Count; i++)
            {
                paramLabel1.Text = elem.Value;
                paramLabel1.ID = elem.Id;
            }
                 
                //testLabel.Text = elem.Value;
                //testLabel.ID = elem.Id;
                //paramElement.Controls.Add(testLabel);
                
            //paramElement.Controls.Add(paramLabel1);
        }
    }
    public class Parameter
    {
        public String Id { get; set; }
        public String Name { get; set; }
        public String Description { get; set; }
        public String Type { get; set; }
        public String Value { get; set; }
        /*public void InitObj(String id, String name, String description, String type, String value)
        {
            Id = id;
            Name = name;
            Description = description;
            Type = type;
            Value = value;
        }*/
    }
}