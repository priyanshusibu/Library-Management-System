      function showSection(sectionId) {
    const sections = document.querySelectorAll('.container > div');
    sections.forEach(section => {
        if (section.id === sectionId) {
            section.classList.remove('hidden');
        } else {
            section.classList.add('hidden');
        }
    });
}
