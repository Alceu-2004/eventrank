import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import CenteredLayout from "../components/CenteredLayout";

interface Usuario {
  id: number;
  nome: string;
}

interface Avaliacao {
  id: number;
  comentario: string;
  nota: number;
  usuario: Usuario | null;
}

interface Evento {
  id: number;
  nome: string;
  descricao?: string;
}

const Dashboard = () => {
  const [eventos, setEventos] = useState<Evento[]>([]);
  const [selecionado, setSelecionado] = useState<Evento | null>(null);
  const [avaliacoes, setAvaliacoes] = useState<Avaliacao[]>([]);
  const [comentario, setComentario] = useState("");
  const [nota, setNota] = useState(5);
  const [loading, setLoading] = useState(false);
  const [erro, setErro] = useState("");

  const navigate = useNavigate();

  // Função para pegar o token do sessionStorage
  const getToken = () => sessionStorage.getItem("token");

  const carregarEventos = async () => {
    try {
      const res = await axios.get("http://localhost:8080/eventos");
      setEventos(res.data);
    } catch (err) {
      console.error("Erro ao carregar eventos:", err);
      setErro("Não foi possível carregar os eventos.");
    }
  };

  const carregarAvaliacoes = async (eventoId: number) => {
    try {
      const token = getToken();
      const headers = token ? { Authorization: `Bearer ${token}` } : {};
      const res = await axios.get(
        `http://localhost:8080/avaliacoes/${eventoId}`,
        { headers }
      );
      setAvaliacoes(res.data);
    } catch (err) {
      console.error("Erro ao carregar avaliações:", err);
      setErro("Não foi possível carregar as avaliações.");
    }
  };

  useEffect(() => {
    carregarEventos();
  }, []);

  useEffect(() => {
    if (selecionado) carregarAvaliacoes(selecionado.id);
  }, [selecionado]);

  const enviarAvaliacao = async () => {
    const token = getToken();

    if (!token) {
      alert("Você precisa estar logado para enviar uma avaliação!");
      navigate("/login");
      return;
    }

    if (!selecionado) return;

    setLoading(true);
    setErro("");

    try {
      await axios.post(
        `http://localhost:8080/avaliacoes/${selecionado.id}`,
        { comentario, nota },
        { headers: { Authorization: `Bearer ${token}` } }
      );

      setComentario("");
      setNota(5);
      carregarAvaliacoes(selecionado.id);
    } catch (err: any) {
      console.error("Erro ao enviar avaliação:", err);
      setErro(err.response?.data?.message || "Erro ao enviar avaliação.");
    } finally {
      setLoading(false);
    }
  };

  const voltarLista = () => {
    setSelecionado(null);
    setAvaliacoes([]);
    setComentario("");
    setNota(5);
    setErro("");
  };

  return (
    <CenteredLayout>
      <div className="max-w-3xl w-full">
        <h1 className="text-2xl mb-4">Eventos</h1>

        {erro && <p className="text-red-600 mb-2">{erro}</p>}

        {!selecionado ? (
          <ul>
            {eventos.map((e) => (
              <li
                key={e.id}
                className="cursor-pointer mb-1 hover:text-blue-600"
                onClick={() => setSelecionado(e)}
              >
                {e.nome}
              </li>
            ))}
          </ul>
        ) : (
          <div className="mt-6">
            <button
              onClick={voltarLista}
              className="mb-2 text-blue-600 underline"
            >
              ← Voltar para eventos
            </button>
            <h2 className="text-xl mb-2">Avaliações de {selecionado.nome}</h2>
            {selecionado.descricao && (
              <p className="mb-4 text-gray-700">{selecionado.descricao}</p>
            )}

            {avaliacoes.length > 0 ? (
              <ul>
                {avaliacoes.map((a) => (
                  <li key={a.id} className="mb-1">
                    <strong>{a.usuario?.nome || "Usuário Desconhecido"}:</strong>{" "}
                    {a.comentario} ({a.nota}/5)
                  </li>
                ))}
              </ul>
            ) : (
              <p className="mb-2">Nenhuma avaliação ainda.</p>
            )}

            <div className="mt-4">
              <textarea
                value={comentario}
                onChange={(e) => setComentario(e.target.value)}
                placeholder="Escreva sua avaliação"
                className="border p-2 w-full mb-2"
              />
              <input
                type="number"
                value={nota}
                onChange={(e) => setNota(Number(e.target.value))}
                min={1}
                max={5}
                className="border p-2 w-20 mb-2"
              />
              <button
                onClick={enviarAvaliacao}
                className="bg-blue-600 text-white p-2 rounded"
                disabled={loading}
              >
                {loading ? "Enviando..." : "Enviar Avaliação"}
              </button>
            </div>
          </div>
        )}
      </div>
    </CenteredLayout>
  );
};

export default Dashboard;
