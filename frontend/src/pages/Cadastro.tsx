import { useState } from "react";
import { useNavigate } from "react-router-dom";

const Cadastro = () => {
  const navigate = useNavigate();
  const [nome, setNome] = useState("");
  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");

  const handleCadastro = (e: React.FormEvent) => {
    e.preventDefault();
    alert("Cadastro realizado com sucesso!");
    navigate("/");
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
        />
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
          className="bg-green-600 text-white p-2 rounded hover:bg-green-700"
        >
          Cadastrar
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