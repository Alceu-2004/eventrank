import { useState } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";

const Cadastro = () => {
  const navigate = useNavigate();
  const [nome, setNome] = useState("");
  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");
  const [loading, setLoading] = useState(false);
  const [erro, setErro] = useState("");

  const validarCampos = () => {
    if (!nome || !email || !senha) {
      setErro("Todos os campos são obrigatórios");
      return false;
    }
    if (senha.length < 6) {
      setErro("A senha deve ter no mínimo 6 caracteres");
      return false;
    }
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(email)) {
      setErro("Email inválido");
      return false;
    }
    return true;
  };

  const handleCadastro = async (e: React.FormEvent) => {
    e.preventDefault();
    setErro("");

    if (!validarCampos()) return;

    setLoading(true);

    try {
      const response = await axios.post("http://localhost:8080/usuarios", {
        nome,
        email,
        senha,
      });

      if (response.status === 201 || response.status === 200) {
        alert("Cadastro realizado com sucesso!");
        navigate("/");
      }
    } catch (error: any) {
      console.error("Erro ao cadastrar:", error);
      setErro(error.response?.data?.message || "Erro ao realizar cadastro");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="flex flex-col items-center justify-center h-screen">
      <h1 className="text-3xl mb-4">Cadastro</h1>
      <form onSubmit={handleCadastro} className="flex flex-col gap-2 w-64">
        <input
          type="text"
          placeholder="Nome"
          className="border p-2 rounded"
          value={nome}
          onChange={(e) => setNome(e.target.value)}
          required
        />
        <input
          type="email"
          placeholder="Email"
          className="border p-2 rounded"
          value={email}
          onChange={(e) => setEmail(e.target.value)}
          required
        />
        <input
          type="password"
          placeholder="Senha"
          className="border p-2 rounded"
          value={senha}
          onChange={(e) => setSenha(e.target.value)}
          required
        />

        {erro && <p className="text-red-600 text-sm">{erro}</p>}

        <button
          type="submit"
          className="bg-green-600 text-white p-2 rounded hover:bg-green-700"
          disabled={loading}
        >
          {loading ? "Cadastrando..." : "Cadastrar"}
        </button>
      </form>

      <button
        onClick={() => navigate("/")}
        className="mt-4 text-blue-600 underline"
      >
        Já tenho conta
      </button>
    </div>
  );
};

export default Cadastro;
