# Gemini API Setup para Memory System

## Estado Actual
- **Decisión**: Usar Gemini para embeddings
- **Método de autenticación**: Variable de entorno
- **Fecha**: 2026-03-01

## ⚠️ ACCIÓN URGENTE: Revocar Key Anterior
Una API key fue compartida en Slack el 2026-03-01 18:32 y está comprometida.

**Pasos:**
1. Ir a Google Cloud Console: https://console.cloud.google.com/
2. Navegar a: APIs & Services → Credentials
3. Buscar la key: `AIzaSyBtlb6cDjjgrDldTgFpmY4ryH_WEpz5lSk`
4. Hacer click en ella y seleccionar "Delete"
5. Confirmar eliminación

## ✅ Generar Nueva API Key

**Pasos:**
1. En Google Cloud Console: APIs & Services → Credentials
2. Click en "Create Credentials" → API Key
3. Copiar la nueva key (de forma segura, NO en Slack)
4. Ir a: APIs & Services → Enabled APIs & Services
5. Verificar que "Google Generative AI API" esté habilitada (si no, habilitarla)

## 🔧 Configurar en tu Mac

### Opción A: Variable de Entorno (Recomendado)

**Paso 1:** Abre tu terminal
```bash
nano ~/.zshrc
```

**Paso 2:** Ve al final del archivo y agrega:
```bash
export GEMINI_API_KEY="tu_nueva_key_aqui"
```

**Paso 3:** Guarda (Ctrl+O, Enter, Ctrl+X)

**Paso 4:** Recarga tu shell:
```bash
source ~/.zshrc
```

**Paso 5:** Verifica que funciona:
```bash
echo $GEMINI_API_KEY
```
Debería mostrar tu key.

### Opción B: Archivo .env (Alternativa)

**Paso 1:** En tu workspace, crea `.env`:
```bash
cd /Users/claudia/.openclaw/workspace
nano .env
```

**Paso 2:** Agrega:
```
GEMINI_API_KEY=tu_nueva_key_aqui
```

**Paso 3:** Guarda y verifica que `.env` esté en `.gitignore`

## 🧪 Testing

Una vez configurada, podemos testear:
```bash
# Verifica que la variable existe
printenv GEMINI_API_KEY

# Testing de memory_search con Gemini (cuando esté configurado)
# Correremos esto después
```

## 📝 Próximos Pasos

1. ✅ Revocar key comprometida
2. ✅ Generar key nueva
3. ✅ Configurar variable de entorno
4. ⏳ Test memory_search
5. ⏳ Configurar OpenClaw para usar Gemini embeddings

---

**Cuando estés listo, dime:**
- ¿Qué opción elegiste? (Opción A o B)
- ¿Ya tienes la key nueva?
- ¿Configuraste la variable?

Yo valido y continuamos.
