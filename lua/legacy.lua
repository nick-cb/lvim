function CompileLatex()
	vim.cmd([[
    silent! !pdflatex '%:p'
  ]])
end

function StartCompileOnSave()
	vim.cmd([[
    augroup CompileLatex
      autocmd BufWritePost *.tex silent! !pdflatex '%:p'
    augroup END
]])
end

function StopCompileOnSave()
	vim.cmd([[
    autocmd! CompileLatex
  ]])
end


