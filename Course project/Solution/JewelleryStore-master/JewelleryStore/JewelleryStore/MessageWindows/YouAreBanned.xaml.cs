using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace JewelleryStore.MessageWindows
{
    /// <summary>
    /// Логика взаимодействия для YouAreBanned.xaml
    /// </summary>
    public partial class YouAreBanned : Window
    {
        public YouAreBanned()
        {
            InitializeComponent();
        }
        private void ButtonOK_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }
    }
}
