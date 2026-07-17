const form = document.querySelector('#conceptForm');
const conceptList = document.querySelector('#conceptList');
const recommendation = document.querySelector('#recommendation');
const namePreview = document.querySelector('#namePreview');
const logoPreview = document.querySelector('#logoPreview');

const sliders = ['memorability', 'fit', 'distinct', 'scalable'];
const concepts = [];

sliders.forEach((id) => {
  const slider = document.querySelector(`#${id}`);
  const value = document.querySelector(`#${id}Value`);
  slider.addEventListener('input', () => {
    value.textContent = slider.value;
  });
});

function calculateScore(concept) {
  const weights = {
    memorability: 0.3,
    fit: 0.3,
    distinct: 0.22,
    scalable: 0.18,
  };

  return Math.round((
    concept.memorability * weights.memorability +
    concept.fit * weights.fit +
    concept.distinct * weights.distinct +
    concept.scalable * weights.scalable
  ) * 10);
}

function renderConcepts() {
  const ranked = [...concepts].sort((a, b) => b.score - a.score);
  const winner = ranked[0];

  conceptList.innerHTML = ranked.map((concept, index) => `
    <article class="concept-card">
      <div class="mini-logo">${concept.logoText}</div>
      <div>
        <strong>${index + 1}. ${concept.brandName}</strong>
        <div class="meta">${concept.styleTone} style · M${concept.memorability} / F${concept.fit} / D${concept.distinct} / S${concept.scalable}</div>
      </div>
      <div class="score">${concept.score}</div>
    </article>
  `).join('');

  if (!winner) {
    recommendation.className = 'recommendation empty';
    recommendation.textContent = 'Add at least one concept to generate a ranked decision.';
    return;
  }

  recommendation.className = 'recommendation';
  recommendation.innerHTML = `<strong>${winner.brandName}</strong> is the strongest option with a ${winner.score}/100 score. Use the <strong>${winner.logoText}</strong> mark for the first app icon and launch lockup.`;
  namePreview.textContent = winner.brandName;
  logoPreview.textContent = winner.logoText;
}

form.addEventListener('submit', (event) => {
  event.preventDefault();

  const concept = {
    brandName: form.brandName.value.trim(),
    logoText: form.logoText.value.trim().toUpperCase(),
    styleTone: form.styleTone.value,
    memorability: Number(document.querySelector('#memorability').value),
    fit: Number(document.querySelector('#fit').value),
    distinct: Number(document.querySelector('#distinct').value),
    scalable: Number(document.querySelector('#scalable').value),
  };

  concept.score = calculateScore(concept);
  concepts.push(concept);
  renderConcepts();
  form.reset();
  sliders.forEach((id) => {
    document.querySelector(`#${id}Value`).textContent = '7';
  });
});

renderConcepts();
