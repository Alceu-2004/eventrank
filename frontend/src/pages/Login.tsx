import { useState } from "react";
import { useNavigate } from "react-router-dom";
import api from "../services/api";
import CenteredLayout from "../components/CenteredLayout";

const Login = () => {
  const navigate = useNavigate();
  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");

  const handleLogin = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!email || !senha) {
      alert("Preencha todos os campos!");
      return;
    }

    try {
      const response = await api.post("/login", { email, senha });
      const token = response.data.token;
      const nomeUsuario = response.data.nome;

      sessionStorage.setItem("token", token);
      sessionStorage.setItem("nomeUsuario", nomeUsuario);

      navigate("/dashboard");
    } catch (error) {
      alert("Email ou senha incorretos");
      console.error(error);
    }
  };

  return (
    <CenteredLayout>
      <div className="flex flex-col items-center">
        <h1 className="text-3xl mb-4">Login</h1>
        <form onSubmit={handleLogin} className="flex flex-col gap-2 max-w-xs mx-auto">
          <input
            type="email"
            placeholder="Email"
            className="border p-2 rounded"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
          <input
            type="password"
            placeholder="Senha"
            className="border p-2 rounded"
            value={senha}
            onChange={(e) => setSenha(e.target.value)}
          />
          <button
            type="submit"
            className="bg-blue-600 text-white p-2 rounded hover:bg-blue-700"
          >
            Entrar
          </button>
        </form>
        <button
          onClick={() => navigate("/cadastro")}
          className="mt-4 text-blue-600 underline"
        >
          Criar conta
        </button>
      </div>
    </CenteredLayout>
  );
};

export default Login;
