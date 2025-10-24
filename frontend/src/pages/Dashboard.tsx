import { useState, useEffect, useRef } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import { Search, Menu } from "lucide-react";
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
  const [filtro, setFiltro] = useState("");
  const [menuAberto, setMenuAberto] = useState(false);
  const [usuarioLogado, setUsuarioLogado] = useState<string | null>(null);

  const navigate = useNavigate();
  const menuRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const token = sessionStorage.getItem("token");
    const nomeUsuario = sessionStorage.getItem("nomeUsuario");
    setUsuarioLogado(token && nomeUsuario ? nomeUsuario : null);

    const handleClickOutside = (event: MouseEvent) => {
      if (menuRef.current && !menuRef.current.contains(event.target as Node)) {
        setMenuAberto(false);
      }
    };
    document.addEventListener("mousedown", handleClickOutside);
    return () => document.removeEventListener("mousedown", handleClickOutside);
  }, []);

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
      const token = sessionStorage.getItem("token");
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
    const token = sessionStorage.getItem("token");
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

  const logout = () => {
    sessionStorage.clear();
    setUsuarioLogado(null);
    voltarLista();
    setMenuAberto(false);
  };

  const eventosFiltrados = eventos.filter((e) =>
    e.nome.toLowerCase().includes(filtro.toLowerCase())
  );

  return (
    <div className="w-full">
      {/* HEADER */}
          <header className="bg-blue-600 text-white flex justify-between items-center p-4 fixed top-0 left-0 w-full z-50 shadow-md">
      {/* Logo */}
      <div
        className="text-lg font-bold cursor-pointer"
        onClick={() => {
          voltarLista();
          setMenuAberto(false);
        }}
      >
        EventRank
      </div>

      {/* Botão e menu lateral dentro do header */}
      <div className="relative flex items-center" ref={menuRef}>
        {/* Botão de menu */}
        <button
          onClick={() => setMenuAberto(!menuAberto)}
          className={`p-2 rounded hover:bg-blue-500 transition-transform duration-300 ${
            menuAberto ? "-translate-x-16" : "translate-x-0"
          }`}
        >
          <Menu size={24} />
        </button>

        {/* Menu que aparece à direita do botão */}
        {menuAberto && (
          <div
            className="absolute top-1/2 -translate-y-1/2 left-full ml-4 bg-white text-black rounded shadow-lg flex flex-col py-2 w-32 animate-slide-down z-50"
          >
            <span
              className="px-4 py-2 hover:bg-gray-100 cursor-pointer"
              onClick={() => {
                voltarLista();
                setMenuAberto(false);
              }}
            >
              Eventos
            </span>

            {!usuarioLogado ? (
              <span
                className="px-4 py-2 hover:bg-gray-100 cursor-pointer"
                onClick={() => {
                  navigate("/login");
                  setMenuAberto(false);
                }}
              >
                Login
              </span>
            ) : (
              <span
                className="px-4 py-2 hover:bg-gray-100 cursor-pointer"
                onClick={logout}
              >
                Sair
              </span>
            )}
          </div>
        )}
      </div>
    </header>

      {/* CONTEÚDO PRINCIPAL */}
      <CenteredLayout>
        <div className="max-w-3xl w-full mt-24 mb-10">
          <h1 className="text-2xl mb-4">Eventos</h1>

          {erro && <p className="text-red-600 mb-2">{erro}</p>}

          {!selecionado ? (
            <>
              <div className="flex items-center mb-4">
                <Search className="mr-2" size={20} />
                <input
                  type="text"
                  placeholder="Pesquisar eventos..."
                  value={filtro}
                  onChange={(e) => setFiltro(e.target.value)}
                  className="border p-2 rounded w-full"
                />
              </div>

              <ul>
                {eventosFiltrados.map((e) => (
                  <li
                    key={e.id}
                    className="cursor-pointer mb-1 hover:text-blue-600"
                    onClick={() => setSelecionado(e)}
                  >
                    {e.nome}
                  </li>
                ))}
              </ul>
            </>
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
    </div>
  );
};

export default Dashboard;
