using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace размер_окна_при_клике
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void Form1_MouseDown(object sender, MouseEventArgs e)
        {
           this.Size = new Size(this.Width+100, this.Height+100);   
        }

        private void Form1_MouseLeave(object sender, EventArgs e)
        {
            this.Size = new Size(this.Width - 100, this.Height - 100);

        }
    }
}
