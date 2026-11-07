# CV

El CV se edita en `cv.md`. Al hacer push a `main` con cambios en esta carpeta,
la GitHub Action `.github/workflows/cv.yml` genera `assets/files/cv.pdf`
(el PDF que se descarga desde la web) y lo sube con un commit automático.

| Archivo         | Para qué sirve                                    |
| --------------- | ------------------------------------------------- |
| `cv.md`         | El contenido del CV (lo único que hay que tocar)  |
| `style.css`     | Formato del PDF: márgenes, fuentes, espaciados    |
| `template.html` | Plantilla HTML que usa pandoc                     |
| `build.sh`      | Script que genera el PDF                          |

## Cómo escribir en `cv.md`

- **Cada salto de línea cuenta**: una línea nueva en el `.md` es una línea nueva
  en el PDF. Un párrafo largo va entero en una sola línea.
- **Una línea en blanco** separa entradas (deja un hueco, como en el CV).
- `## Título` → título de sección centrado en mayúsculas.
- `### Subtítulo` → subtítulo en negrita (p. ej. *Computational*).
  Con `{.underline}` al final sale subrayado (p. ej. *Oral communications*).
- `**negrita**`, `*cursiva*`, `- ` para viñetas.
- `[2025-2026]{.right}` → texto alineado a la derecha en la misma línea
  (fechas, lugares).
- Bloque con sangría francesa y sin huecos entre entradas (premios, proyectos,
  comunicaciones): rodéalo con `::: hanging` y `:::`, separando cada entrada
  con una línea en blanco.

Ejemplo de entrada:

```markdown
**University of La Laguna** [San Cristóbal de La Laguna, Spain]{.right}
PhD in Health Sciences [2025-Present]{.right}
```

## Generarlo en local (opcional)

Necesitas `pandoc` y `weasyprint` (`pipx install weasyprint`):

```bash
cv/build.sh                 # sobrescribe assets/files/cv.pdf
cv/build.sh /tmp/prueba.pdf # o genera una copia para revisar
```

También se puede lanzar a mano desde GitHub: *Actions → Build CV PDF → Run workflow*.
