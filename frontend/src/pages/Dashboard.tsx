import { useState, useEffect } from "react";
import axios from "axios";

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
  local?: string;
}

const Dashboard = () => {
  const [eventos, setEventos] = useState<Evento[]>([]);
  const [selecionado, setSelecionado] = useState<Evento | null>(null);
  const [avaliacoes, setAvaliacoes] = useState<Avaliacao[]>([]);
  const [comentario, setComentario] = useState("");
  const [nota, setNota] = useState(5);
  const [loading, setLoading] = useState(false);
  const [erro, setErro] = useState("");

  const token = localStorage.getItem("token");

  const carregarEventos = async () => {
    try {
      const res = await axios.get("http://localhost:8080/eventos", {
        headers: { Authorization: `Bearer ${token}` },
      });
      setEventos(res.data);
    } catch (err) {
      console.error("Erro ao carregar eventos:", err);
      setErro("Não foi possível carregar os eventos.");
    }
  };

  const carregarAvaliacoes = async (eventoId: number) => {
    try {
      const res = await axios.get(`http://localhost:8080/avaliacoes/${eventoId}`, {
        headers: { Authorization: `Bearer ${token}` },
      });
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
    if (selecionado) {
      carregarAvaliacoes(selecionado.id);
    }
  }, [selecionado]);

  const enviarAvaliacao = async () => {
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
    <div className="p-6 flex flex-col items-center justify-center min-h-screen bg-gray-50">
      <div className="bg-white shadow-md rounded-2xl p-6 w-full max-w-2xl">
        <h1 className="text-2xl font-bold mb-4 text-center">Eventos</h1>

        {erro && <p className="text-red-600 mb-2">{erro}</p>}

        {!selecionado ? (
          <ul>
            {eventos.map((e) => (
              <li
                key={e.id}
                className="cursor-pointer mb-2 p-3 border rounded hover:bg-blue-50 hover:text-blue-700 transition"
                onClick={() => setSelecionado(e)}
              >
                {e.nome}
              </li>
            ))}
          </ul>
        ) : (
          <div>
            <button
              onClick={voltarLista}
              className="mb-3 text-blue-600 underline"
            >
              ← Voltar para eventos
            </button>

            <h2 className="text-xl font-semibold mb-2">{selecionado.nome}</h2>

            {/* Exibe descrição do evento */}
            {selecionado.descricao ? (
              <p className="text-gray-700 mb-4">{selecionado.descricao}</p>
            ) : (
              <p className="text-gray-400 mb-4 italic">
                Nenhuma descrição disponível para este evento.
              </p>
            )}

            {/* Exibe avaliações */}
            <h3 className="text-lg font-semibold mb-2">Avaliações:</h3>
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

            {/* Formulário de nova avaliação */}
            <div className="mt-4">
              <textarea
                value={comentario}
                onChange={(e) => setComentario(e.target.value)}
                placeholder="Escreva sua avaliação"
                className="border p-2 w-full mb-2 rounded"
              />
              <input
                type="number"
                value={nota}
                onChange={(e) => setNota(Number(e.target.value))}
                min={1}
                max={5}
                className="border p-2 w-20 mb-2 rounded"
              />
              <button
                onClick={enviarAvaliacao}
                className="bg-blue-600 text-white p-2 rounded hover:bg-blue-700 transition"
                disabled={loading}
              >
                {loading ? "Enviando..." : "Enviar Avaliação"}
              </button>
            </div>
          </div>
        )}
      </div>
    </div>
  );
};

export default Dashboard;
