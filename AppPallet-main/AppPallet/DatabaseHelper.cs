using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using AppPallet.Models;
using PCLExt.FileStorage;
using PCLExt.FileStorage.Folders;
using SQLite;


namespace AppPallet
{
    class DatabaseHelper
    {
        //defina uma conexao e o  nome do banco de dados
        static SQLiteConnection sqliteconnection;
        public string DbFileName = "PalletDB.db";

        public DatabaseHelper()
        {
            //cria uma pasta base local para o dispositivo
            var pasta = new LocalRootFolder();
            //cria o arquivo
            var arquivo = pasta.CreateFile(DbFileName, CreationCollisionOption.OpenIfExists);
            //abre o BD
            sqliteconnection = new SQLiteConnection(arquivo.Path);

            //cria a tabela no BD
            sqliteconnection.CreateTable<Login>();
            sqliteconnection.CreateTable<LoginAcesso>();
            sqliteconnection.CreateTable<VerificaCarga>();
            //sqliteconnection.CreateTable<SavingClass>();
        }

        // Verificar se há um login salvo
        public bool IsUserLoggedIn()
        {
            var login = sqliteconnection.Table<Login>().FirstOrDefault();
            return login != null;
        }

        // Inserir dados Login
        public void InsertLogin(Login login)
        {
            
            var existingLogin = GetLoginByCodigo(login.codigo);
            if (existingLogin != null)
            {
                login.Id_key = existingLogin.Id_key;
                UpdateLogin(login);
            }
            else
            {
                sqliteconnection.Insert(login);
            }
        }
        // Inserir dados LoginAcesso
        public void InsertLoginAcesso(LoginAcesso loginAcesso)
        {
            var existingLoginAcesso = GetLoginAcessoByCodigo(loginAcesso.codigo);
            if (existingLoginAcesso != null)
            {
                loginAcesso.Id_key = existingLoginAcesso.Id_key;
                UpdateLoginAcesso(loginAcesso);
            }
            else
            {
                sqliteconnection.Insert(loginAcesso);
            }
        }
        // Inserir dados VerificaCarga
        public void InsertVerificaCarga(VerificaCarga verificaCarga)
        {
            var existingLoginAcesso = GetLoginAcessoByCodigo(verificaCarga.ID);
            if (existingLoginAcesso != null)
            {
                verificaCarga.Id_key = existingLoginAcesso.Id_key;
                UpdateVerificaCarga(verificaCarga);
            }
            else
            {
                sqliteconnection.Insert(verificaCarga);
            }
        }
        // Atualizar dados Login
        public void UpdateLogin(Login login)
        {
            sqliteconnection.Update(login);
        }

        // Atualizar dados LoginAcesso
        public void UpdateLoginAcesso(LoginAcesso loginAcesso)
        {
            sqliteconnection.Update(loginAcesso);
        }
        // Atualizar dados VerificaCarga
        public void UpdateVerificaCarga(VerificaCarga verificaCarga)
        {
            sqliteconnection.Update(verificaCarga);
        }
        //Pegar todos os dados Login 
        public List<Login> GetAllLoginData()
        {
            return (from data in sqliteconnection.Table<Login>()
                    select data).ToList();
        }
        //Pegar todos os dados LoginAcesso
        public List<LoginAcesso> GetAllLoginAcessoData()
        {
            return (from data in sqliteconnection.Table<LoginAcesso>()
                    select data).ToList();
        }
        //Pegar todos os dados VerificaCarga
        public List<VerificaCarga> GetAllVerificaCargaData()
        {
            return (from data in sqliteconnection.Table<VerificaCarga>()
                    select data).ToList();
        }
        //Pegar dados especifico por id
        public Login GetLoginByCodigo(string id)
        {
            return sqliteconnection.Table<Login>().FirstOrDefault(t => t.codigo == id);
        }
        public LoginAcesso GetLoginAcessoByCodigo(string id)
        {
            return sqliteconnection.Table<LoginAcesso>().FirstOrDefault(t => t.codigo == id);
        }
        public VerificaCarga GetVerificaCargaByCodigo(string id)
        {
            return sqliteconnection.Table<VerificaCarga>().FirstOrDefault(t => t.ID == id);
        }
        // Deletar todos os dados Login
        public void DeleteAllLogin()
        {
            sqliteconnection.DeleteAll<Login>();
        }
        // Deletar todos os dados LoginAcesso
        public void DeleteAllLoginAcesso()
        {
            sqliteconnection.DeleteAll<LoginAcesso>();
        }
        // Deletar todos os dados VerificaCarga
        public void DeleteAllVerificaCarga()
        {
            sqliteconnection.DeleteAll<VerificaCarga>();
        }
        // Deletar um dado especifico por id
        public void DeleteLogin(int id)
        {
            sqliteconnection.Delete<Login>(id);
        }
        public void DeleteLoginAcesso(int id)
        {
            sqliteconnection.Delete<LoginAcesso>(id);
        }
        public void DeleteVerificaCarga(int id)
        {
            sqliteconnection.Delete<VerificaCarga>(id);
        }
    }
}
