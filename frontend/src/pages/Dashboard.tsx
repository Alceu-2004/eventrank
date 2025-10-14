import React, { useEffect, useState } from "react";
import api from "../services/api";

interface Event {
  id: number;
  nome: string;
  data: string;
}

const Dashboard: React.FC = () => {
  const [events, setEvents] = useState<Event[]>([]);

  useEffect(() => {
    const fetchEvents = async () => {
      try {
        const token = localStorage.getItem("token");
        const response = await api.get("/eventos", {
          headers: { Authorization: `Bearer ${token}` },
        });
        setEvents(response.data);
      } catch (error) {
        console.error("Erro ao buscar eventos", error);
      }
    };

    fetchEvents();
  }, []);

  return (
    <div>
      <h1>Dashboard</h1>
      <ul>
        {events.map((event) => (
          <li key={event.id}>{event.nome} — {event.data}</li>
        ))}
      </ul>
    </div>
  );
};

export default Dashboard;
