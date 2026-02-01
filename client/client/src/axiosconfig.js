import axios from "axios";

console.log("Loaded API URL:", import.meta.env.VITE_API_URL);

const instance = axios.create({
  baseURL: "https://finalevanforumg3j26-production.up.railway.app/api",
});

instance.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem("token");
    if (token) {
      config.headers.Authorization = `Bearer ${token}`;
    }
    return config;
  },
  (error) => Promise.reject(error)
);

instance.interceptors.response.use(
  (response) => response,
  (error) => {
    console.error("API ERROR:", error.response?.data || error.message);
    return Promise.reject(error);
  }
);

export default instance;
