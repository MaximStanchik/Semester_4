using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace LBR_01
{
    internal static class MainProgramm
    {
        /// <summary>
        /// Главная точка входа для приложения.
        /// </summary>
        [STAThread]
        static void Main()
        {
            try
            {
                Application.EnableVisualStyles();
                Application.SetCompatibleTextRenderingDefault(false);
                Application.Run(new TPCalculatorForRealsForm());
            }
            catch(Exception ex)
            {
                MessageBox.Show("Возникло исключение! " + ex.Message);
            }
        }
    }
}
